from flask import Flask, render_template, request, url_for, redirect, flash
from werkzeug.routing import BuildError
import pymysql
from pymysql import InterfaceError
import secrets

secret_key = secrets.token_hex(16)

app = Flask(__name__)
app.secret_key = secret_key

# Create a connection to the database
def db_conn():
    
    db_host = 'localhost'
    db_user = 'zuleinisrl'
    db_pass = 'comp4018'
    db_name = 'db_ZuleinisNorbertoJose'

    try:
        conn = pymysql.connect(host=db_host, user=db_user, password=db_pass, database=db_name)
    except InterfaceError as e:
        # Handling the InterfaceError exception
        error_code = e.args[0]
        error_message = e.args[1]
        print(f"InterfaceError occurred. Error code: {error_code}, Message: {error_message}")
        
    return conn

@app.route('/home')
def home():
    return render_template('home.html')

@app.route('/view_all_games_form')
def view_all_games_form():
    return render_template('form.html')

@app.route('/view_all_games', methods=['GET', 'POST'])
def view_all_games():
    # Retrieve the user input from the form
    username = request.form['username']
    
    try:
        # Open connection
        conn = db_conn()
        # Create a cursor object
        cursor = conn.cursor()
    except InterfaceError as e:
        error_code = e.args[0]
        error_message = e.args[1]
        return(f"InterfaceError occurred. Error code: {error_code}, Message: {error_message}")

    # Execute the SQL query to retrieve the video games and progress for the user
    query = """
    SELECT V.gameName, J.completionPercent
    FROM VideoGame V
    JOIN Juega J ON V.videogameID = J.videogameID
    JOIN Usuario U ON J.userName = U.userName
    WHERE U.userName = %s
    """
    
    try:
        cursor.execute(query, (username,))
        rows = cursor.fetchall()
    except InterfaceError as e:
        error_code = e.args[0]
        error_message = e.args[1]
        return(f"InterfaceError occurred. Error code: {error_code}, Message: {error_message}")

    finally:
        # Close the cursor and connection
        cursor.close()
        conn.close()

    return render_template('user_games.html', username=username, rows=rows)

@app.route('/add_user', methods=['GET', 'POST'])
def add_user():
    if request.method == 'POST':
        # Get username from the form data
        username = request.form['username']
        firstname = request.form['firstname']
        lastname = request.form['lastname']
        email = request.form['email']

        # Open connection
        conn = db_conn()
        # Create a cursor object
        cursor = conn.cursor()

        # Check if the username already exists in the database
        query = "SELECT COUNT(*) FROM `Usuario` WHERE `userName` = %s"
        
        try:
            cursor.execute(query, (username,))
            result = cursor.fetchone()
        except InterfaceError as e:
            error_code = e.args[0]
            error_message = e.args[1]
            return(f"InterfaceError occurred. Error code: {error_code}, Message: {error_message}")

        # If the username already exists, display an alert
        if result[0] > 0:
            message = "failed"
            return render_template('add_user.html', message=message)

        # Execute the SQL query to insert the user into the users table
        query = """
            INSERT INTO `Usuario`(`userName`, `firstName`, `lastName`, `email`) 
            VALUES (%s, %s, %s, %s)
            """
        values = (username, firstname, lastname, email)
        
        try:
            cursor.execute(query, values)

            # Commit the transaction
            conn.commit()
        except InterfaceError as e:
            error_code = e.args[0]
            error_message = e.args[1]
            return(f"InterfaceError occurred. Error code: {error_code}, Message: {error_message}")

        finally:
            # Close the cursor and connection
            cursor.close()
            conn.close()
        

        # Display a success alert
        message = "success"
        return render_template('add_user.html', message=message)
    # If the request method is GET, render the add_user.html template
    return render_template('add_user.html')

# Route to handle editing the username
@app.route('/edit_username', methods=['GET', 'POST'])
def edit_username():
    if request.method == 'POST':
        # Get the current username and the new username from the form data
        current_username = request.form['current_username']
        new_username = request.form['new_username']
        
        try:
            # Open connection
            conn = db_conn()
            # Perform the necessary logic to update the username in the database
            cursor = conn.cursor()
        except InterfaceError as e:
            error_code = e.args[0]
            error_message = e.args[1]
            return(f"InterfaceError occurred. Error code: {error_code}, Message: {error_message}")

        # Verify the current username
        sql = "SELECT username FROM Usuario WHERE username = %s"
        
        try:
            cursor.execute(sql, (current_username,))
            result = cursor.fetchone()
        except InterfaceError as e:
            error_code = e.args[0]
            error_message = e.args[1]
            return(f"InterfaceError occurred. Error code: {error_code}, Message: {error_message}")

        if result:
            # Updating the username in the 'Usuario' table
            usuario_update_query = """
                UPDATE Usuario
                SET userName = %s
                WHERE userName = %s
                """

            # Updating the username in the 'Juega' table
            juega_update_query = """
                UPDATE Juega
                SET userName = %s
                WHERE userName = %s
                """
                
            try:
                # Execute the queries with the appropriate values
                cursor.execute(usuario_update_query, (new_username, current_username))
                cursor.execute(juega_update_query, (new_username, current_username))
            except InterfaceError as e:
                error_code = e.args[0]
                error_message = e.args[1]
                return(f"InterfaceError occurred. Error code: {error_code}, Message: {error_message}")

            try:
                conn.commit()
                conn.close()
            except InterfaceError as e:
                error_code = e.args[0]
                error_message = e.args[1]
                return(f"InterfaceError occurred. Error code: {error_code}, Message: {error_message}")

            message = "success"
            return render_template('edit_username.html', message=message)

        else:
            conn.close()
            message = "failed"
            return render_template('edit_username.html', message=message)


    # If the request method is GET, render the edit_username.html template
    return render_template('edit_username.html')


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
